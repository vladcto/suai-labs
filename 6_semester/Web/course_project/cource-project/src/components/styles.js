import { makeStyles } from "@material-ui/core/styles"

export const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
  },
  list: {
    width: "30%",
  },
  prompts: {
    width: "70%",
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
  },
  copyButton: {
    alignSelf: "flex-end",
    marginBottom: theme.spacing(2),
  },
}))
