const times: number[] = [];

for (let i = 0; i < 10; i++) {
  const cmd = new Deno.Command(
    "nvim",
    {
      args: [
        "--startuptime",
        `${i}.log`,
        "--cmd",
        "autocmd VimEnter * qall",
      ],
    },
  );
  await cmd.output();
  const text = await Deno.readTextFile(`${i}.log`);
  await Deno.remove(`${i}.log`);
  const lines = text.split("\n");
  const last_line = lines.find((line) => {
    return line.includes("BufEnter autocommands");
  });
  if (!last_line) {
    throw new Error("Failed to find last line");
  }
  const time = last_line.split(" ")[0];
  times.push(Number(time));
}

const [min, max, sum] = times.reduce((pre, crr) => {
  const min = Math.min(pre[0], crr);
  const max = Math.max(pre[1], crr);
  const sum = pre[2] + crr;

  return [min, max, sum];
}, [100000, 0, 0]);
const avg = Math.round((sum / times.length) * 100) / 100;

const data = [
  {
    "name": "Average nvim startup time",
    "unit": "ms",
    "value": avg,
  },
  {
    "name": "Min nvim startup time",
    "unit": "ms",
    "value": min,
  },
  {
    "name": "Max nvim startup time",
    "unit": "ms",
    "value": max,
  },
];

await Deno.writeTextFile("data.json", JSON.stringify(data));
