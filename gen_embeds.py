import ollama
import json
from pathlib import Path
import time

HERE = Path(__file__).parent

# list of sentence embedding pairs
embeds = []

with open(HERE / "input.json", "r") as f:
    input = json.loads(f.read())
    data = input["poemSentences"]

    for i, sentence in enumerate(data):
        start = time.perf_counter()
        print(f"Processing sentence {i+1} of {len(data)}")
        embed = ollama.embeddings("mistral", prompt=sentence)
        embeds.append({"sentence": sentence, "embed": embed["embedding"]})
        print(
            f"Completed sentence {i+1} of {len(data)} in {time.perf_counter() - start:.2f} seconds"
        )

with open(HERE / "input_embedded.json", "w") as f:
    f.write(json.dumps(embeds))

print("Done")
