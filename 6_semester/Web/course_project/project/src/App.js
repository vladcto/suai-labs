import React from "react"
import LeftColumn from "./components/LeftColumn/LeftColumn"
import RightColumn from "./components/RightColumn/RightColumn"
import prompts from "./data"

const App = () => {
  // Add state management for selectedPrompt using React context or Redux

  return (
    <div style={{ display: "flex" }}>
      <LeftColumn prompts={prompts} />
      <RightColumn />
    </div>
  )
}

export default App
