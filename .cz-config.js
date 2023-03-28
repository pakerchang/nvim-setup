module.exports = {
  types: [
    { value: "feat", name: "feat: 增加" },
    { value: "fix", name: "fix: bug fix" },
    { value: "docs", name: "docs: 修改文件" },
    { value: "del", name: "del: 刪除" },
  ],
  scopes: [{ name: "Documents" }, { name: "settings" }],
  messages: {
    type: "選擇更改類型:\n",
    scope: "選擇 scope（Options）：\n",
    customScope: "請輸入自定義的 scope：",
    subject: "簡述:\n",
    body: '詳細描述. 使用"|"換行:\n',
    breaking: "Breaking Changes列表:\n",
    footer: "關閉的issues列表. E.g.: #31, #34:\n",
    confirmCommit: "確定送出?",
  },
  allowCustomScopes: true,
  allowBreakingChanges: ["feat", "fix"],
};
