import requests
import os
import json
import time

def call_ai(system_prompt, user_prompt, github_token, json_mode=True):
    headers = {
        'Authorization': f'Bearer {github_token}',
        'Content-Type': 'application/json',
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28'
    }
    data = {
        'model': 'openai/gpt-4o',
        'messages': [
            {'role': 'system', 'content': system_prompt},
            {'role': 'user', 'content': user_prompt}
        ]
    }
    if json_mode:
        data['response_format'] = {'type': 'json_object'}

    response = requests.post('https://models.github.ai/inference/chat/completions', headers=headers, json=data)
    response.raise_for_status()
    content = response.json()['choices'][0]['message']['content']
    return json.loads(content) if json_mode else content

def generate():
    idea_content = os.environ.get('IDEA_CONTENT')
    github_token = os.environ.get('GITHUB_TOKEN')
    app_dir = 'apps/generated_app'
    os.makedirs(app_dir, exist_ok=True)

    print("Step 1: Planning the project architecture...")
    plan_prompt = (
        "You are a Lead Software Architect. Based on the user's app idea, create a comprehensive "
        "Project Map for a professional Flutter application using Clean Architecture. "
        "List EVERY file path needed (at least 20-30 files) including models, screens, widgets, "
        "services, and full android configuration. "
        "Output MUST be a JSON object: {'project_name': '...', 'files': ['path1', 'path2', ...]}"
    )
    project_plan = call_ai(plan_prompt, f"Plan this app: {idea_content}", github_token)
    file_list = project_plan.get('files', [])
    print(f"Plan created with {len(file_list)} files.")

    print("Step 2: Generating files in batches...")
    # Batch files to avoid hitting token limits while maintaining context
    batch_size = 5
    for i in range(0, len(file_list), batch_size):
        batch = file_list[i:i+batch_size]
        print(f"Generating batch {i//batch_size + 1}: {batch}")
        
        gen_prompt = (
            "You are a Senior Flutter Developer. Generate the FULL CODE for the following files "
            "based on the overall project plan. Ensure all files are interconnected and production-ready. "
            "Output MUST be a JSON object: {'files': [{'path': '...', 'content': '...'}]}"
        )
        user_msg = f"App Idea: {idea_content}\nFiles to generate now: {batch}\nFull Project Map: {file_list}"
        
        try:
            batch_data = call_ai(gen_prompt, user_msg, github_token)
            for file_data in batch_data.get('files', []):
                full_path = os.path.join(app_dir, file_data['path'])
                os.makedirs(os.path.dirname(full_path), exist_ok=True)
                with open(full_path, 'w', encoding='utf-8') as f:
                    f.write(file_data['content'])
                print(f"  - Saved: {file_data['path']}")
        except Exception as e:
            print(f"Error in batch: {e}")
        
        time.sleep(1) # Small delay to respect rate limits

    print("Generation Complete!")

if __name__ == "__main__":
    generate()
