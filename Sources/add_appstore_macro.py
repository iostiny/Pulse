import os

def process_swift_file(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
    
    with open(file_path, 'w') as f:
        f.write("#if APPSTORE\n")
        f.write(content)
        f.write("\n#endif\n")

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".swift"):
                file_path = os.path.join(root, file)
                process_swift_file(file_path)
                print(f"Processed: {file_path}")

if __name__ == "__main__":
    target_directory = "."  # 修改为你要处理的目录
    process_directory(target_directory)


