module.exports = {
  "user-api": {
    input: {
      target: "./openapi.yml",
    },
    output: {
      mode: "split",
      target: "./api/hooks/useUsers.ts",
      schemas: './api/models',
      client: "swr",
      mock: true,
    },
  },
};
