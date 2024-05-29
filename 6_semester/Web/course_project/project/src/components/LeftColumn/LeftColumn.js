import React from "react"
import { List, ListItem, ListItemText } from "@mui/material"
import useStyles from "./style"
import { useSelector } from "react-redux"

const LeftColumn = () => {
  const classes = useStyles()
  const prompts = useSelector((state) => state.prompts)

  return (
    <List className={classes.list}>
      {prompts.map((prompt, index) => (
        <ListItem button key={index}>
          <ListItemText
            primary={prompt.title}
            secondary={prompt.description}
            primaryTypographyProps={{ variant: "h6", weight: "bold" }}
          />
        </ListItem>
      ))}
    </List>
  )
}

export default LeftColumn
