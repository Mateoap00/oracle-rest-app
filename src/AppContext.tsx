import { createContext, useReducer, useContext, ReactNode } from 'react';

type AppState = {
    isEditing: boolean;
    isAdding: boolean;
};

type AppAction = {
    type: 'SET_EDIT_MODE' | 'SET_ADD_MODE';
    payload: object;
};

type AppContextType = {
    state: AppState;
    dispatch: React.Dispatch<AppAction>;
};

const initialState: AppState = {
    isEditing: false,
    isAdding: true,
};

const appReducer = (state: AppState, action: AppAction): AppState => {
    switch (action.type) {
        case 'SET_EDIT_MODE':
            return { isEditing: true, isAdding: false };
        case 'SET_ADD_MODE':
            return { isEditing: false, isAdding: true };
        default:
            return state;
    }
};

const AppContext = createContext<AppContextType | undefined>(undefined);

export const useAppContext = (): AppContextType => {
    const context = useContext(AppContext);
    if (!context) {
        throw new Error('useAppContext must be used within an AppProvider');
    }
    return context;
};

export const AppProvider: React.FC<{ children: ReactNode }> = ({
    children,
}) => {
    const [state, dispatch] = useReducer(appReducer, initialState);

    return (
        <AppContext.Provider value={{ state, dispatch }}>
            {children}
        </AppContext.Provider>
    );
};
