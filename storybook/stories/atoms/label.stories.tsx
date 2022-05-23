import { Label, LabelProps } from "@/components";
import { ComponentStory, Story } from "@storybook/react";

export default {
  title: "atoms/Label",
  component: Label,
};

const Template: ComponentStory<typeof Label> = (args) => <Label {...args} />;

const mainLabelProps = {
  
};

export const TooltipLabels = Template.bind({});

TooltipLabels.args = {
  label: "Label master here",
  TypographyProps: {},
  TooltipProps: {
    title: "Tooltip master here",
  },
};

export const TooltipLabelsWithBalance = Template.bind({});

TooltipLabelsWithBalance.args = {
  label: "Amount",  
  LabelTypographyProps: {},
  BalanceProps: {
    title: "Balance ",
    balance: "435",
  }
};