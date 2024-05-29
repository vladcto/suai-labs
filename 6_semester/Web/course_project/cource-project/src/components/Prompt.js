import React from "react"
import { Typography, Button } from "@material-ui/core"
import { FileCopy as CopyIcon } from "@material-ui/icons"
import { useStyles } from "./styles"

const Prompt = ({ prompt, onCopy }) => {
  const classes = useStyles()

  return (
    <>
      <Typography variant="h5" gutterBottom>
        {prompt.title}
      </Typography>
      <Typography variant="body1" gutterBottom>
        {prompt.description}
      </Typography>
      <Button
        variant="contained"
        color="primary"
        className={classes.copyButton}
        endIcon={<CopyIcon />}
        onClick={() => onCopy(prompt.description)}
      >
        Copy
      </Button>
    </>
  )
}

export default Prompt
