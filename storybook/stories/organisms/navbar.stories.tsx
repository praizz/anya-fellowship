import { NavBar } from "@/components/Organisms/NavBar";
import { Box, Button, Typography } from "@mui/material";
import { ComponentStory } from "@storybook/react";

const NavBarStories = () => {
  return (
    <Box width={300}>
      <NavBar />
    </Box>
  );
};
export default {
  title: "organisms/NavBar",
  component: NavBar,
};

const Template: ComponentStory<typeof NavBar> = (args) => (
  <NavBarStories {...args} />
);

export const Default = Template.bind({});
Default.args = {};
