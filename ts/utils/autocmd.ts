declare var autocmdFunctions: { [id: string]: () => void }
autocmdFunctions = {}

declare var _G: any
_G["callAutoCmdFunction"] = (id: string) => {
  autocmdFunctions[id]()
}

type AutoCmdArgs = {
  id: string,
  events: string | string[],
  filetypes: string | string[],
  command: string | (() => void)
}
export const autocmd: (args: AutoCmdArgs) => void = ({ id, events, filetypes, command }) => {
  const commandText =
    typeof command === "string"
      ? command
      : `lua callAutoCmdFunction("${id}")`
  if (typeof command !== "string") {
    autocmdFunctions[id] = command
  }

  const eventsText =
    typeof events === "string"
      ? events
      : events.join(",")
  const fileTypesText =
    typeof filetypes === "string"
      ? filetypes
      : filetypes.join(",")

  vim.cmd("augroup myautocmd")
  vim.cmd(`autocmd! ${eventsText} ${fileTypesText} ${commandText}`)
  vim.cmd("augroup END")
}
