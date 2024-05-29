import React from "react"
import PromptList from "./components/PromptList"
import Prompt from "./components/Prompt"
import { prompts } from "./data"

export default function App() {
  const [selectedPrompt, setSelectedPrompt] = React.useState(null)

  const handleListItemClick = (prompt) => {
    setSelectedPrompt(prompt)
  }

  const handleCopy = (text) => {
    navigator.clipboard.writeText(text)
  }

  return (
    <div className="App">
      <PromptList prompts={prompts} onSelect={handleListItemClick} />
      {selectedPrompt && <Prompt prompt={selectedPrompt} onCopy={handleCopy} />}
    </div>
  )
}

