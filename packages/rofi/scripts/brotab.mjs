#!/usr/bin/env zx

$.verbose = false;
const args = argv["_"];

// if (args.length === 0) {
//   // await new Promise((resolve) => setTimeout(resolve, 3000));
//   // const list = await showTabs();
//   // console.log(list.map((tab) => `${tab.id}\t${tab.title}`).join("\n"));
//   console.log("udin")
// }

// if (args.length > 0) {
//   $`notify-send '${args.join(" ")}'`
// }

console.log("udin")
await new Promise((resolve) => setTimeout(resolve, 3000));

const tabs = await showTabs()
const windows = await showWindows()

console.log(tabs.map((tab) => `${tab.id}\t${tab.title}`).join("\n"));

function activateTab() {}

async function showTabs() {
  const tabs = [];
  const rawTabs = await $`bt list`;
  rawTabs.stdout.split("\n").forEach((line) => {
    const [id, title, url] = line.split("\t");
    tabs.push({ id, title, url });
  });

  return tabs;
}

async function showWindows() {
  const windows = [];

  const rawWindows = await $`wmctrl -l`;
  rawWindows.stdout.split("\n").forEach((line) => {
    let [id, desktop, _host, ...title] = line.split(/\s+/);
    title = title.join(" ");

    if (desktop === "-1") return;

    if (id && desktop && title) {
      windows.push({ id, desktop, title });
    }
  });

  return windows;
}

// vim: ft=javascript
