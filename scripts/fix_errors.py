import requests
import os
import json

def fix():
    token = os.environ.get("GITHUB_TOKEN")
    app_dir = os.environ.get("APP_DIR")
    
    if not os.path.exists("error_log.txt"):
        print("No error_log.txt found.")
        return

    with open("error_log.txt", "r") as f:
        error_log = f.read()[-2000:] # Last 2000 chars

    context = {}
    for root, _, files in os.walk(app_dir):
        for file in files:
            if file.endswith(('.dart', '.yaml', '.gradle')):
                path = os.path.join(root, file)
                try:
                    with open(path, 'r', encoding='utf-8') as f:
                        context[path.replace(app_dir + os.sep, "")] = f.read()
                except:
                    pass

    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json",
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28"
    }

    data = {
        "model": "openai/gpt-4o",
        "messages": [
            {"role": "system", "content": "You are a Flutter Build Expert. Fix the provided error. Output ONLY a JSON object: {'files': [{'path': '...', 'content': '...'}]}"},
            {"role": "user", "content": f"Error:\n{error_log}\n\nContext:\n{json.dumps(context)}"}
        ],
        "response_format": {"type": "json_object"}
    }

    print("Calling AI for fix...")
    response = requests.post("https://models.github.ai/inference/chat/completions", headers=headers, json=data)
    response.raise_for_status()
    
    fix_data = response.json()['choices'][0]['message']['content']
    fixes = json.loads(fix_data)

    for f in fixes.get('files', []):
        full_path = os.path.join(app_dir, f['path'])
        os.makedirs(os.path.dirname(full_path), exist_ok=True)
        with open(full_path, 'w', encoding='utf-8') as out:
            out.write(f['content'])
        print(f"Applied fix to: {f['path']}")

if __name__ == "__main__":
    fix()
