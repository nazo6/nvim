const times: number[] = [];

for (let i = 0; i < 10; i++) {
  const process = Deno.run({
    cmd: ["nvim", "--startuptime", `${i}.log`, "-c", "qa!"],
  });
  await process.status();
  const text = await Deno.readTextFile(`${i}.log`);
  const lines = text.split("\n");
  const time = lines[lines.length - 2].split(" ")[0];
  times.push(Number(time));
}

const [min, max, sum] = times.reduce((pre, crr) => {
  const min = Math.min(pre[0], crr);
  const max = Math.max(pre[1], crr);
  const sum = pre[2] + crr;

  return [min, max, sum];
}, [100000, 0, 0]);
const ave = Math.round((sum / times.length) * 100) / 100;

const data = [
  {
    "name": "Average nvim startup time",
    "unit": "ms",
    "value": ave,
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
