import { useState, useEffect } from 'react';
import { EventRequest } from '../services/eventsService';
import { useAppContext } from '../AppContext';

type EventsRowProps = {
    eventReq: EventRequest;
};

export const EventsRow: React.FC<EventsRowProps> = ({ eventReq }) => {
    const { state, dispatch } = useAppContext();
    const [checked, setChecked] = useState<boolean>(false);

    useEffect(() => {
        if (state.isAdding) {
            setChecked(false);
        }
        if (state.editing.isEditing) {
            setChecked(true);
        }
    }, [state]);

    return (
        <tr
            key={eventReq.eventno}
            onClick={() => {
                if (!checked) {
                    dispatch({
                        type: 'SET_EDIT_MODE',
                        payload: eventReq,
                    });
                } else {
                    dispatch({
                        type: 'SET_ADD_MODE',
                        payload: {},
                    });
                }
                setChecked(!checked);
            }}
        >
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                <input
                    type="checkbox"
                    className="form-checkbox h-5 w-5 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded"
                    checked={checked}
                    onChange={() => {
                        setChecked(!checked);
                    }}
                />
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-black">
                {eventReq.eventno}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.budno}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.custno}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.facno}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.datereq}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.dateheld}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.dateauth}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.estaudience}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.estcost}
            </td>
            {eventReq.status === 'Approved' ? (
                <td className="whitespace-nowrap px-4 py-2 text-green-600 dark:text-gray-200">
                    {eventReq.status}
                </td>
            ) : null}
            {eventReq.status === 'Pending' ? (
                <td className="whitespace-nowrap px-4 py-2 text-yellow-600 dark:text-gray-200">
                    {eventReq.status}
                </td>
            ) : null}
            {eventReq.status === 'Denied' ? (
                <td className="whitespace-nowrap px-4 py-2 text-red-600 dark:text-gray-200">
                    {eventReq.status}
                </td>
            ) : null}
        </tr>
    );
};
