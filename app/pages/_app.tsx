import * as React from "react";
import { hotjar } from "react-hotjar";
import Head from "next/head";
import { AppProps } from "next/app";
import { ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";
import { CacheProvider, EmotionCache } from "@emotion/react";
import createEmotionCache from "@/styles/createEmotionCache";
import { createTheme } from "@/styles/theme";
import { ColorModeContext } from "@/contexts/ColorMode";

// Client-side cache, shared for the whole session of the user in the browser.
const clientSideEmotionCache = createEmotionCache();

interface MyAppProps extends AppProps {
  emotionCache?: EmotionCache;
}

const initializeContentful = async () => {
  // const {fields} = await getEntry({
  //   id: "[ENTER_ENTRY_ID_TO_FETCH_JSON_FROM_CONTENTFUL]"
  // });
  // console.log(fields);
};

const initializeHotjar = () => {
  if (
    process.env.NODE_ENV === "production" &&
    process.env.NEXT_PUBLIC_HOTJAR_ID &&
    process.env.NEXT_PUBLIC_HOTJAR_SITE_ID
  ) {
    hotjar.initialize(
      parseInt(process.env.NEXT_PUBLIC_HOTJAR_ID),
      parseInt(process.env.NEXT_PUBLIC_HOTJAR_SITE_ID)
    );
  }
};

export default function MyApp(props: MyAppProps) {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props;
  const [mode, setMode] = React.useState<"light" | "dark">("dark");
  const colorMode = React.useMemo(
    () => ({
      toggleColorMode: () => {
        setMode((prevMode) => (prevMode === "light" ? "dark" : "light"));
      },
    }),
    []
  );

  const theme = React.useMemo(() => createTheme(mode), [mode]);

  React.useEffect(initializeHotjar, []);
  React.useEffect(() => {
    initializeContentful();
  }, []);

  return (
    <CacheProvider value={emotionCache}>
      <Head>
        <meta name="viewport" content="initial-scale=1, width=device-width" />
      </Head>
      <ColorModeContext.Provider value={colorMode}>
        <ThemeProvider theme={theme}>
          {/* CssBaseline kickstart an elegant, consistent, and simple baseline to build upon. */}
          <CssBaseline />
          <Component {...pageProps} />
        </ThemeProvider>
      </ColorModeContext.Provider>
    </CacheProvider>
  );
}
