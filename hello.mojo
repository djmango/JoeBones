from pathlib import Path
from python import Python

struct SentEmbed:
  var sent: String
  var embeds: DynamicVector[Float16]
  
  fn __init__(inout self, sent: String, embeds: DynamicVector[Float16]):
    self.sent = sent
    self.embeds = embeds

fn main() raises:
    let json = Python.import_module("json")
    let sent_embeds: ListLiteral[SentEmbed]
    let data: PythonObject
    with open("input_embedded.json", "r") as f:
      let file_content = f.read()
      data = json.loads(file_content)
      
    # for (sent, embeds) in data.items():
    #   let embeds = DynamicVector[Float16](embeds)
    #   let sent_embed = SentEmbed(sent, embeds)
    #   sent_embeds.append(sent_embed)
    print(data)

