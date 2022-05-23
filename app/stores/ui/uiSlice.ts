import { createSlice, PayloadAction } from '@reduxjs/toolkit';

interface UIState {

}

const initialState: UIState = {

};

export const uiSlice = createSlice({
    name: "UI",
    initialState,
    reducers: {

    },
});

export const { 
    
} = uiSlice.actions;


export default uiSlice.reducer;