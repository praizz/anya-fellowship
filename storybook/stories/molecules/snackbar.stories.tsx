import { Story } from "@storybook/react";

import { Snackbar, SnackbarProps, Link } from "@/components";
import OpenInNewRoundedIcon from "@mui/icons-material/OpenInNewRounded";

const SnackbarStories = (props: SnackbarProps) => {
  return (
    <Snackbar {...props} />
  );
};

export default {
  title: "molecules/Snackbar",
  component: SnackbarStories,
};

const Template: Story<typeof SnackbarStories> = (args) => (
  <SnackbarStories {...args} />
);

export const Snackbars = Template.bind({});

Snackbars.args = {
  AlertProps: {
    severity: "success",
    alertText: "I will close in 6 seconds...",
    underlined: false,
    onClose: () => {},
    action: (
      <Link
        href="/"
        target="_blank"
        rel="noopener"
      >
        <OpenInNewRoundedIcon />
      </Link>
    )
  },
  open: true,
}
