import { useState, useEffect } from 'react';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import {
    EventRequest,
    createEventRequest,
    updateEventRequest,
    deleteEventRequest,
} from '../services/eventsService';
import { Customers } from '../services/customersService';
import { Facilities } from '../services/facilitiesService';
import { useAppContext } from '../AppContext';
import { formatDate } from '../utils/formatDate';
import { reverseFormatDate } from '../utils/reverseFormatDate';
import { generateEventNo } from '../utils/generateEventNo';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import { ActionButtons } from './ActionButtons';
import toast from 'react-hot-toast';

type EventsFormProps = {
    customers: Customers[];
    facilities: Facilities[];
};

const EventsForm: React.FC<EventsFormProps> = ({ customers, facilities }) => {
    const queryClient = useQueryClient();

    const createEventReqMutation = useMutation({
        mutationFn: createEventRequest,
        onSuccess: (data) => {
            if (typeof data === 'string' && data !== '') {
                toast.dismiss();
                toast.error('Error, información no valida para el evento.');
            } else {
                toast.dismiss();
                toast.success('Evento agregado exitosamente.');
                setTimeout(() => {
                    queryClient.invalidateQueries('eventsRequest');
                }, 1000);
            }
        },
    });

    const updateEventReqMutation = useMutation({
        mutationFn: updateEventRequest,
        onSuccess: (data) => {
            if (typeof data === 'string' && data !== '') {
                toast.dismiss();
                toast.error('Error, información no valida para el evento.');
            } else {
                toast.dismiss();
                toast.success('Evento editado exitosamente.');
                setTimeout(() => {
                    queryClient.invalidateQueries('eventsRequest');
                    dispatch({ type: 'SET_ADD_MODE', payload: {} });
                }, 1000);
            }
        },
    });

    const deleteEventReqMutation = useMutation({
        mutationFn: deleteEventRequest,
        onSuccess: () => {
            toast.dismiss();
            toast.success('Evento eliminado exitosamente.');
            setTimeout(() => {
                queryClient.invalidateQueries('eventsRequest');
                dispatch({ type: 'SET_ADD_MODE', payload: {} });
            }, 1000);
        },
    });

    const eventsReq: EventRequest[] | undefined = queryClient.getQueryData([
        'eventsRequest',
    ]);

    const { state, dispatch } = useAppContext();
    const editMode = state.editing.isEditing;
    const addMode = state.isAdding;
    const editEventReq: EventRequest | undefined = state.editing.eventReq;

    const currentDate = new Date();
    currentDate.setHours(0, 0, 0, 0);

    const [eventNo, setEventNo] = useState<string>('');
    const [customer, setCustomer] = useState<string>('');
    const [facility, setFacility] = useState<string>('');
    const [dateReq, setDateReq] = useState<Date>(currentDate);
    const [dateHeld, setDateHeld] = useState<Date>(currentDate);
    const [dateAuth, setDateAuth] = useState<Date | null>(null);
    const [estAudience, setEstAudience] = useState<number>(0);
    const [estCost, setEstCost] = useState<number>(0);
    const [status, setStatus] = useState<string>('Pending');

    useEffect(() => {
        if (editMode && editEventReq) {
            setEventNo(editEventReq.eventno);
            setCustomer(editEventReq.custno);
            setFacility(editEventReq.facno);
            setDateReq(reverseFormatDate(editEventReq.datereq));
            setDateHeld(reverseFormatDate(editEventReq.dateheld));
            setDateAuth(
                editEventReq.dateauth
                    ? reverseFormatDate(editEventReq.dateauth)
                    : null
            );
            setEstAudience(editEventReq.estaudience);
            setEstCost(editEventReq.estcost);
            setStatus(editEventReq.status);
        }
        if (state.isAdding) {
            setEventNo(generateEventNo(eventsReq));
            setCustomer('');
            setFacility('');
            setDateReq(currentDate);
            setDateHeld(currentDate);
            setDateAuth(null);
            setEstAudience(0);
            setEstCost(0);
            setStatus('Pending');
        }
    }, [state]);

    const handleAddEventReq = (e: React.MouseEvent<HTMLButtonElement>) => {
        e.preventDefault();
        const newEventReq: EventRequest = {
            eventno: eventNo,
            dateheld: formatDate(dateHeld),
            datereq: formatDate(dateReq),
            custno: customer,
            facno: facility,
            dateauth: null,
            status: status,
            estcost: estCost,
            estaudience: estAudience,
            budno: 'B1000',
        };
        createEventReqMutation.mutate(newEventReq);
    };

    const handleUpdateEventReq = (e: React.MouseEvent<HTMLButtonElement>) => {
        e.preventDefault();
        const updateEventReq: EventRequest = {
            eventno: eventNo,
            custno: customer,
            facno: facility,
            dateheld: formatDate(dateHeld),
            datereq: formatDate(dateReq),
            dateauth: dateAuth ? formatDate(dateAuth) : null,
            estcost: estCost,
            estaudience: estAudience,
            status: status,
            budno: 'B1000',
        };
        updateEventReqMutation.mutate(updateEventReq);
    };

    const handleDeleteEventReq = (e: React.MouseEvent<HTMLButtonElement>) => {
        e.preventDefault();
        if (editEventReq) {
            window.confirm(
                `Se va a eliminar el evento ${editEventReq.eventno}, ¿está seguro?`
            )
                ? deleteEventReqMutation.mutate(editEventReq.eventno)
                : console.log('No eliminado');
        }
    };

    return (
        <>
            <div className="mx-auto max-w-screen-xl px-4 py-4 sm:px-6 lg:px-8">
                <div className="mx-auto max-w-lg">
                    <h1 className="text-center text-2xl font-bold text-indigo-600 sm:text-3xl">
                        Events Request Rest APP
                    </h1>
                    <p className="mx-auto mt-4 max-w-md text-center text-gray-500">
                        Aplicación CRUD para consumir una API REST de eventos
                        usando Oracle Rest Data Services (ORDS) y Oracle XE.
                    </p>

                    <form
                        action=""
                        className="mb-0 mt-6 space-y-4 rounded-lg p-4 shadow-lg sm:p-6 lg:p-8 bg-[#30343f]"
                    >
                        <p className="text-center text-lg font-medium text-white">
                            {addMode
                                ? 'Agregar un nuevo evento'
                                : 'Editar un evento existente'}
                        </p>

                        <div className="mt-8 grid grid-cols-6 gap-6">
                            <div className="col-span-6 sm:col-span-3">
                                <label
                                    htmlFor="customerSelect"
                                    className="block text-sm font-medium text-white"
                                >
                                    Customer
                                </label>

                                <select
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    name="customerSelect"
                                    id="customerSelect"
                                    required
                                    value={customer}
                                    onChange={(e) => {
                                        setCustomer(e.target.value);
                                    }}
                                >
                                    <option value="">
                                        Seleccionar customer...
                                    </option>
                                    {customers.map((customer) => {
                                        return (
                                            <option
                                                key={customer.custno}
                                                value={customer.custno}
                                            >
                                                {customer.custno}
                                                {' - '}
                                                {customer.custname}
                                            </option>
                                        );
                                    })}
                                </select>
                            </div>

                            <div className="col-span-6 sm:col-span-3">
                                <label
                                    htmlFor="facilitySelect"
                                    className="block text-sm font-medium text-white"
                                >
                                    Facility
                                </label>

                                <select
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    name="facilitySelect"
                                    id="facilitySelect"
                                    required
                                    value={facility}
                                    onChange={(e) => {
                                        setFacility(e.target.value);
                                    }}
                                >
                                    <option value="">
                                        Seleccionar facility...
                                    </option>
                                    {facilities.map((facility) => {
                                        return (
                                            <option
                                                key={facility.facno}
                                                value={facility.facno}
                                            >
                                                {facility.facno}
                                                {' - '}
                                                {facility.facname}
                                            </option>
                                        );
                                    })}
                                </select>
                            </div>
                        </div>

                        <div className="mt-8 grid grid-cols-6 gap-6">
                            <div className="col-span-6 sm:col-span-3">
                                <label
                                    htmlFor="dateReqPicker"
                                    className="block text-sm font-medium text-white"
                                >
                                    Date of request
                                </label>
                                <DatePicker
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    name="dateReqPicker"
                                    placeholderText="Select a date..."
                                    dateFormat="dd/MM/yyyy"
                                    required
                                    selected={dateReq}
                                    onChange={(date: Date) => setDateReq(date)}
                                />
                            </div>
                            <div className="col-span-6 sm:col-span-3">
                                <label
                                    htmlFor="dateHeldPicker"
                                    className="block text-sm font-medium text-white"
                                >
                                    Date held
                                </label>
                                <DatePicker
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    name="dateHeldPicker"
                                    placeholderText="Select a date..."
                                    dateFormat="dd/MM/yyyy"
                                    required
                                    selected={dateHeld}
                                    onChange={(date: Date) => setDateHeld(date)}
                                />
                            </div>
                        </div>

                        {editMode ? (
                            <div>
                                <div className="w-full">
                                    <label
                                        htmlFor="dateAuthPicker"
                                        className="block text-sm font-medium text-white"
                                    >
                                        Date of authorization
                                    </label>
                                    <DatePicker
                                        className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                        name="dateAuthPicker"
                                        placeholderText="Select a date..."
                                        dateFormat="dd/MM/yyyy"
                                        selected={dateAuth}
                                        onChange={(date: Date) =>
                                            setDateAuth(date)
                                        }
                                    />
                                </div>
                            </div>
                        ) : null}

                        <div className="mt-8 grid grid-cols-6 gap-6">
                            <div className="col-span-6 sm:col-span-3">
                                <label
                                    htmlFor="audienceEstimateInput"
                                    className="block text-sm font-medium text-white"
                                >
                                    Estimate audience
                                </label>
                                <input
                                    className="h-10 w-full rounded border-gray-200 sm:text-sm"
                                    name="audienceEstimateInput"
                                    id="audienceEstimateInput"
                                    type="number"
                                    required
                                    min={0}
                                    value={estAudience}
                                    onChange={(e) => {
                                        setEstAudience(
                                            parseInt(e.target.value)
                                        );
                                    }}
                                />
                            </div>

                            <div className="col-span-6 sm:col-span-3">
                                <label
                                    htmlFor="audienceEstimateInput"
                                    className="block text-sm font-medium text-white"
                                >
                                    Estimated cost
                                </label>
                                <input
                                    className="h-10 w-full rounded border-gray-200 sm:text-sm"
                                    name="audienceEstimateInput"
                                    id="audienceEstimateInput"
                                    type="number"
                                    required
                                    min={0}
                                    value={estCost}
                                    onChange={(e) => {
                                        setEstCost(parseInt(e.target.value));
                                    }}
                                />
                            </div>
                        </div>

                        {editMode ? (
                            <div>
                                <label
                                    htmlFor="statusSelect"
                                    className="block text-sm font-medium text-white"
                                >
                                    Status
                                </label>

                                <select
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    name="statusSelect"
                                    id="statusSelect"
                                    value={status}
                                    onChange={(e) => {
                                        setStatus(e.target.value);
                                    }}
                                >
                                    <option value="">Select a status...</option>
                                    <option value="Approved">Approved</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Denied">Denied</option>
                                </select>
                            </div>
                        ) : null}

                        {editMode ? (
                            <ActionButtons
                                handleUpdateEventReq={handleUpdateEventReq}
                                handleDeleteEventReq={handleDeleteEventReq}
                            />
                        ) : (
                            <button
                                className="block px-5 py-3 ml-auto mr-auto w-sm rounded-lg bg-indigo-600 text-sm font-medium text-white hover:bg-indigo-800"
                                onClick={(e) => {
                                    handleAddEventReq(e);
                                }}
                            >
                                Agregar evento
                            </button>
                        )}
                    </form>
                </div>
            </div>
        </>
    );
};

export default EventsForm;
