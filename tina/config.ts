import { defineConfig } from "tinacms";
// Your hosting provider likely exposes this as an environment variable
const branch =
  process.env.GITHUB_BRANCH ||
  process.env.VERCEL_GIT_COMMIT_REF ||
  process.env.HEAD ||
  "main";

export default defineConfig({
  branch,
  clientId: process.env.NEXT_PUBLIC_TINA_CLIENT_ID,
  token: process.env.TINA_TOKEN,
  build: {
    publicFolder: "public",
    outputFolder: "admin",
  },
  media: {
    tina: {
      mediaRoot: "",
      publicFolder: "static",
    },
  },
  schema: {
    collections: [
      {
        name: "post",
        label: "Posts",
        path: "content/posts",
        defaultItem: () => ({
          date: new Date().toISOString(),
          author: "Wesley Falize",
        }),
        fields: [
          {
            type: "string",
            name: "title",
            label: "Title",
            isTitle: true,
            required: true,
          },
          {
            type: "datetime",
            name: "date",
            label: "Date",
            required: true,
          },
          {
            name: "author",
            label: "Author",
            type: "string",
            required: true,
          },
          {
            type: "string",
            name: "tags",
            label: "Tags",
            required: false,
            list: true,
          },
          {
            type: "string",
            name: "categories",
            label: "Categories",
            required: false,
            list: true,
          },
          {
            type: "string",
            name: "series",
            label: "Series",
            list: true,
          },
          {
            type: "rich-text",
            name: "body",
            label: "Body",
            isBody: true,
          },
        ],
      },
      {
        name: "series",
        label: "Series",
        path: "content/series",
        fields: [
          {
            type: "string",
            name: "title",
            label: "Title",
            isTitle: true,
            required: true,
          },
        ],
      },
    ],
  },
});
