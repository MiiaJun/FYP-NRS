import { useEffect, useState } from "react";

function App() {
  const [message, setMessage] = useState("");

  useEffect(() => {
    fetch("https://fyp-nrs-production.up.railway.app/api/testing.php")
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        setMessage(data.message);
      })
      .catch((error) => {
        console.error(error);
        setMessage("Failed to connect to PHP backend");
      });
  }, []);

  return (
    <>
      <h1>React + PHP Test</h1>
      <p>{message}</p>
    </>
  );
}

export default App;