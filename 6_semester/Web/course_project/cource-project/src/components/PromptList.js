import React from "react"
import { List, ListItem, ListItemText, Divider } from "@material-ui/core"
import { useStyles } from "./styles"

const PromptList = ({ prompts, onSelect }) => {
  const classes = useStyles()

  return (
    <List className={classes.list}>
      {prompts.map((prompt) => (
        <React.Fragment key={prompt.title}>
          <ListItem button onClick={() => onSelect(prompt)}>
            <ListItemText
              primary={prompt.title}
              secondary={prompt.description}
            />
          </ListItem>
          <Divider />
        </React.Fragment>
      ))}
    </List>
  )
}

export default PromptList
