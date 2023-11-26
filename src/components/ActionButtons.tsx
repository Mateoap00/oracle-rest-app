import { useAppContext } from '../AppContext';
export const ActionButtons = () => {
    const { dispatch } = useAppContext();

    return (
        <>
            <button
                className="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                onClick={() => {
                    dispatch({
                        type: 'SET_EDIT_MODE',
                        payload: {},
                    });
                }}
            >
                Editar
            </button>
            <button
                className="inline-block rounded bg-red-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                onClick={() => {
                    dispatch({
                        type: 'SET_EDIT_MODE',
                        payload: {},
                    });
                }}
            >
                Eliminar
            </button>
        </>
    );
};
