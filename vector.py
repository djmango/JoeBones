import ollama

prompt = input("Enter a word: ")
embedings = ollama.embeddings("mistral", prompt=prompt)
print(embedings)
