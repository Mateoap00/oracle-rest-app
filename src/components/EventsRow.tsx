import { useState, useEffect } from 'react';
import { useMutation } from '@tanstack/react-query';
import { EventRequest } from '../services/eventsService';
import { getAllEventsOfCustomer } from '../services/customersService';
import { getAllEventsOfFacility } from '../services/facilitiesService';
import { EventOfCustomer } from '../services/customersService';
import { EventOfFacility } from '../services/facilitiesService';
import { useAppContext } from '../AppContext';

type EventsRowProps = {
    eventReq: EventRequest;
};

export const EventsRow: React.FC<EventsRowProps> = ({ eventReq }) => {
    const getCustomerEventsMutation = useMutation({
        mutationFn: getAllEventsOfCustomer,
        onSuccess: (data) => {
            if (data) {
                showCustomerEvents(data);
            }
        },
    });

    const getFacilityEventsMutation = useMutation({
        mutationFn: getAllEventsOfFacility,
        onSuccess: (data) => {
            if (data) {
                showFacilityEvents(data);
            }
        },
    });

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

    const handleCustomerInfo = (custno: string) => {
        getCustomerEventsMutation.mutate(custno);
    };

    const handleFacilityInfo = (facno: string) => {
        getFacilityEventsMutation.mutate(facno);
    };

    const showCustomerEvents = (data: EventOfCustomer[]) => {
        const custno = data[0].custno;
        const custname = data[0].custname;
        let msg = `Todos los eventos de: ${custno} - ${custname} son:\n`;
        data.forEach((event) => {
            msg =
                msg +
                `EVENTNO: ${event.eventno}, DATEHELD: ${event.dateheld}, DATEREQ: ${event.datereq}, DATEAUTH: ${event.dateauth}, STATUS: ${event.status}\n--------------------------------------------------------------------\n`;
        });
        window.alert(msg);
    };

    const showFacilityEvents = (data: EventOfFacility[]) => {
        const facno = data[0].facno;
        const facname = data[0].facname;
        let msg = `Todos los eventos de: ${facno} - ${facname} son:\n`;
        data.forEach((event) => {
            msg =
                msg +
                `EVENTNO: ${event.eventno}, DATEHELD: ${event.dateheld}, DATEREQ: ${event.datereq}, DATEAUTH: ${event.dateauth}, STATUS: ${event.status}\n--------------------------------------------------------------------\n`;
        });
        window.alert(msg);
    };

    return (
        <tr key={eventReq.eventno}>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                <input
                    type="checkbox"
                    className="form-checkbox h-5 w-5 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded"
                    checked={checked}
                    onChange={() => {
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
                />
            </td>
            <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-black">
                {eventReq.eventno}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.custno}
                <button
                    className="px-2 rounded-lg hover:bg-gray-200 dark:hover:bg-gray-700"
                    onClick={() => handleCustomerInfo(eventReq.custno)}
                >
                    ℹ️
                </button>
            </td>
            <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                {eventReq.facno}
                <button
                    className="px-2 rounded-lg hover:bg-gray-400 dark:hover:bg-gray-700"
                    onClick={() => handleFacilityInfo(eventReq.facno)}
                >
                    ℹ️
                </button>
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.budno}
            </td>
            <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                {eventReq.datereq}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.dateheld}
            </td>
            <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                {eventReq.dateauth}
            </td>
            <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                {eventReq.estaudience}
            </td>
            <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
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
