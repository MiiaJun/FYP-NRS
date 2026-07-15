import { useState } from "react";
import EditorTest from "./assets/pages/editortest";

function App() {
  const [name, setName] = useState("");
  const [message, setMessage] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch(
        "https://fyp-nrs-production.up.railway.app/api/testing.php",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name: name,
          }),
        }
      );

      const data = await response.json();
      setMessage(data.message);
    } catch (error) {
      console.error(error);
      setMessage("Failed to connect to server.");
    }
  };

  return (
    <div>
      <h1>Insert Test Data</h1>

      <form onSubmit={handleSubmit}>
        <label>
          Name:
          <input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
          />
        </label>

        <br />
        <br />

        <button type="submit">Submit</button>
      </form>

      <p>{message}</p>

	  <EditorTest />
    </div>
  );
}

export default App;