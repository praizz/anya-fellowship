import { 
  alpha, 
  createTheme as createMuiTheme, 
  PaletteMode, 
} from "@mui/material";
import { createBaseTheme } from "./baseTheme";
import { typographyOptions } from "./options";
import { 
  appBarOverrides, 
  backdropOverrides, 
  buttonOverrides, 
  chipOverrides, 
  dialogOverrides, 
  inputAdornmentOverrides, 
  inputLabelOverrides, 
  linearProgressOverrides, 
  linkOverrides, 
  listItemIconOverrides, 
  listItemOverrides, 
  listItemTextOverrides, 
  listSubheaderOverrides, 
  menuItemOverrides, 
  outlinedInputOverrides, 
  paperOverrides, 
  switchOverrides, 
  tabOverrides, 
  tabsOverrides, 
  toolbarOverrides, 
  typographyOverrides, 
  tableOverrides,
  tableCellOverrides,
  accordionOverrides,
  accordionSummaryOverrides,
  accordionDetailsOverrides,
  alertOverrides,
  tooltipOverrides,
  cssBaselineOverrides, 
} from "./overrides";

export const createTheme = (mode: PaletteMode) => {
  const theme = createBaseTheme(mode);
  return (
    createMuiTheme(
      theme, 
      {
        palette: {
          ...theme.palette,
          mode,
          text: {
            primary: theme.palette.common.white,
            secondary: (
              alpha(
                theme.palette.common.white,
                theme.custom.opacity.darker
              )
            ),
            disabled: (
              alpha(
                theme.palette.common.white, 
                theme.custom.opacity.main
              )
            ),
          },
          background: {
            default: theme.palette.primary.dark,
            paper: (
              alpha(
                theme.palette.primary.main, 
                theme.custom.opacity.lightest
              )
            ),
          },
          divider: theme.palette.secondary.dark,  
        },
        typography: typographyOptions(theme),
        components: {
          MuiCssBaseline: cssBaselineOverrides(theme),
          MuiButton: buttonOverrides(theme),
          MuiTypography: typographyOverrides(),
          MuiSwitch: switchOverrides(theme),
          MuiAppBar: appBarOverrides(),
          MuiToolbar: toolbarOverrides(theme),
          MuiListItem: listItemOverrides(theme),
          MuiListItemIcon: listItemIconOverrides(theme),
          MuiListItemText: listItemTextOverrides(),
          MuiDialog: dialogOverrides(),
          MuiBackdrop: backdropOverrides(theme),
          MuiPaper: paperOverrides(theme),
          MuiTabs: tabsOverrides(theme),
          MuiTab: tabOverrides(theme),
          MuiLinearProgress: linearProgressOverrides(theme),
          MuiChip: chipOverrides(theme),
          MuiLink: linkOverrides(theme),
          MuiInputLabel: inputLabelOverrides(theme),
          MuiOutlinedInput: outlinedInputOverrides(theme),
          MuiInputAdornment: inputAdornmentOverrides(theme),
          MuiListSubheader: listSubheaderOverrides(theme),
          MuiMenuItem: menuItemOverrides(theme),
          MuiTable: tableOverrides(theme),
          MuiTableCell: tableCellOverrides(theme),
          MuiAccordion: accordionOverrides(theme),
          MuiAccordionSummary: accordionSummaryOverrides(theme),
          MuiAccordionDetails: accordionDetailsOverrides(theme),
          MuiAlert: alertOverrides(theme),
          MuiTooltip: tooltipOverrides(theme),
        },
      }
    )
  );
};
