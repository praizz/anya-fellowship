export type Asset = {
  icon: string;
  label?: string;
};

type MenuItem = {
  label: string;
  path: string;
  icon: React.ComponentType<any>;
  endAdornment?: React.ReactNode;
  status: "active" | "inactive";
  matches?: string[];
};

export type MenuItemType = MenuItem & {
  subItems?: Array<MenuItem>;
};