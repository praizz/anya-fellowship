import type { NextPage } from "next";
import { Container, Typography, Box } from "@mui/material";
import Default from "@/components/Templates/Default";

const Home: NextPage = () => {
  return (
    <Default>
      <Container maxWidth="lg">
        <Box
          sx={{
            my: 4,
            display: "flex",
            flexDirection: "column",
            justifyContent: "center",
            alignItems: "center",
          }}
        >
          <Typography variant="h4" component="h1" gutterBottom>
            Welcome to UI Template app
          </Typography>
        </Box>
      </Container>
    </Default>
    
  );
};

export default Home;
