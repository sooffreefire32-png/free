import requests
import os
import json

def generate():
    idea_content = os.environ.get('IDEA_CONTENT')
    github_token = os.environ.get('GITHUB_TOKEN')

    if not idea_content or not github_token:
        print('Error: IDEA_CONTENT or GITHUB_TOKEN not found.')
        return

    headers = {
        'Authorization': f'Bearer {github_token}',
        'Content-Type': 'application/json',
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28'
    }

    system_prompt = (
        "You are an expert Flutter developer. Generate a complete, self-contained Flutter application "
        "based on the user's idea. Provide the full project structure, including pubspec.yaml, lib/main.dart, "
        "and all necessary android configuration files (build.gradle, AndroidManifest.xml, etc.). "
        "The output MUST be a JSON object with a 'files' key, containing an array of {path: string, content: string} objects."
    )

    data = {
        'model': 'openai/gpt-4o',
        'messages': [
            {'role': 'system', 'content': system_prompt},
            {'role': 'user', 'content': f'Generate a Flutter app for: {idea_content}'}
        ],
        'response_format': {'type': 'json_object'}
    }

    print("Calling GitHub Models API...")
    response = requests.post('https://models.github.ai/inference/chat/completions', headers=headers, json=data)
    response.raise_for_status()
    
    # Extract the JSON string from the response
    content_str = response.json()['choices'][0]['message']['content']
    generated_json = json.loads(content_str)

    app_dir = 'apps/generated_app'
    os.makedirs(app_dir, exist_ok=True)

    for file_data in generated_json.get('files', []):
        path = file_data['path']
        content = file_data['content']
        full_path = os.path.join(app_dir, path)
        os.makedirs(os.path.dirname(full_path), exist_ok=True)
        with open(full_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Created: {path}")

if __name__ == "__main__":
    generate()
