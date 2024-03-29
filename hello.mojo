from pathlib import Path
from python import Python, Dictionary
from tensor import Tensor, TensorSpec, TensorShape

let spec = TensorSpec(DType.float32, 1, 4096)

struct SentEmbed:
  var sent: String
  # var embeds: DynamicVector[Float16]
  # var embeds: Tensor[DType.float32](spec)
  var embeds: Tensor[DType.float32]

fn main() raises:
    let json = Python.import_module("json")
    let sent_embeds: ListLiteral[SentEmbed]
    let data: PythonObject
    with open("input_embedded.json", "r") as f:
      let file_content = f.read()
      data = json.loads(file_content)
      
    # for sent in data.items():
    #   let embeds = DynamicVector[Float16](embeds)
    #   let sent_embed = SentEmbed(sent, embeds)
    #   sent_embeds.append(sent_embed)
    print(data)

