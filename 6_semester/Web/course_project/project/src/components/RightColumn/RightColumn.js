import React from "react"
import { Typography, Button } from "@mui/material"
import useStyles from "./style"
import { useSelector } from "react-redux"

const RightColumn = () => {
  const classes = useStyles()
  const selectedPrompt = useSelector((state) => state.selectedPrompt)

  const copyToClipboard = () => {
    navigator.clipboard.writeText(selectedPrompt.text)
  }

  return (
    <div className={classes.root}>
      <Typography variant="h5" gutterBottom>
        {selectedPrompt.title}
      </Typography>
      <Typography variant="subtitle1" gutterBottom>
        {selectedPrompt.description}
      </Typography>
      <Typography variant="body1" paragraph>
        {selectedPrompt.text}
      </Typography>
      <Button variant="contained" color="primary" onClick={copyToClipboard}>
        Copy to Clipboard
      </Button>
    </div>
  )
}

export default RightColumn
