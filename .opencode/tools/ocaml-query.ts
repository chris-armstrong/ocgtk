import { tool } from "@opencode-ai/plugin";

export const generate_mli = tool({
  description: "Generate OCaml interface file (.mli) from implementation file",
  args: {
    file: tool.schema
      .string()
      .nonoptional()
      .describe(".ml file to generate .mli from .ml file"),
  },
  async execute({ file }) {
    const result = await Bun.$`ocamlc -i ${file}`;
    return result.trim();
  },
});
