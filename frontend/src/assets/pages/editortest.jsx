import { useState } from "react";
import { CKEditor } from "@ckeditor/ckeditor5-react";

import {
  ClassicEditor,
  Bold,
  Essentials,
  Heading,
  Italic,
  Link,
  List,
  Paragraph,
  Table,
  TableToolbar,
  Undo
} from "ckeditor5";

import "ckeditor5/ckeditor5.css";

export default function EditorTest() {
  const [content, setContent] = useState("<h1>Hello from CKEditor 5!</h1>");

  return (
    <div style={{ maxWidth: "900px", margin: "40px auto" }}>
      <CKEditor
        editor={ClassicEditor}
        config={{
          licenseKey: "GPL",

          plugins: [
            Essentials,
            Paragraph,
            Heading,
            Bold,
            Italic,
            Link,
            List,
            Table,
            TableToolbar,
            Undo
          ],

          toolbar: [
            "undo",
            "redo",
            "|",
            "heading",
            "|",
            "bold",
            "italic",
            "|",
            "link",
            "|",
            "bulletedList",
            "numberedList",
            "|",
            "insertTable"
          ],

          initialData: content
        }}
        onChange={(event, editor) => {
          const data = editor.getData();
          setContent(data);
        }}
      />

      <h2>Generated HTML</h2>

      <pre>
        {content}
      </pre>
    </div>
  );
}