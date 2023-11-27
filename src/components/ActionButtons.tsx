import { useAppContext } from '../AppContext';

type ActionButtonsProps = {
    handleUpdateEventReq: (e: React.MouseEvent<HTMLButtonElement>) => void;
    handleDeleteEventReq: (e: React.MouseEvent<HTMLButtonElement>) => void;
};
export const ActionButtons: React.FC<ActionButtonsProps> = ({
    handleUpdateEventReq,
    handleDeleteEventReq,
}) => {
    const editMode = useAppContext().state.editing.isEditing;

    return (
        <>
            {editMode ? (
                <>
                    <button
                        className="block px-5 py-3 ml-auto mr-auto w-sm rounded-lg bg-indigo-600 text-sm font-medium text-white hover:bg-indigo-800"
                        onClick={(e) => {
                            handleUpdateEventReq(e);
                        }}
                    >
                        Editar
                    </button>
                    <button
                        className="block px-5 py-3 ml-auto mr-auto w-sm rounded-lg bg-red-600 text-sm font-medium text-white hover:bg-red-800"
                        onClick={(e) => {
                            handleDeleteEventReq(e);
                        }}
                    >
                        Eliminar
                    </button>
                </>
            ) : null}
        </>
    );
};
