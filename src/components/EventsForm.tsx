import { useState } from 'react';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { EventRequest, createEventRequest } from '../services/eventsService';
import { Customers } from '../services/customersService';
import { Facilities } from '../services/facilitiesService';
import { useAppContext } from '../AppContext';
import DatePicker from 'react-datepicker';
import { formatDate } from '../utils/formatDate';
import { generateEventNo } from '../utils/generateEventNo';
import 'react-datepicker/dist/react-datepicker.css';

type EventsFormProps = {
    customers: Customers[];
    facilities: Facilities[];
};

const EventsForm: React.FC<EventsFormProps> = ({ customers, facilities }) => {
    // const { dispatch } = useAppContext();
    const editMode = useAppContext().state.isEditing;
    const addMode = useAppContext().state.isAdding;

    const [customer, setCustomer] = useState<string>('');
    const [facility, setFacility] = useState<string>('');
    const [dateReq, setDateReq] = useState<Date | null>(null);
    const [dateHeld, setDateHeld] = useState<Date | null>(null);
    const [dateAuth, setDateAuth] = useState<Date | null>(null);
    const [estAudience, setEstAudience] = useState<number>(0);
    const [estCost, setEstCost] = useState<number>(0);
    const [status, setStatus] = useState<string>('Pending');

    const queryClient = useQueryClient();
    const createEventReqMutation = useMutation({
        mutationFn: createEventRequest,
        onSuccess: () => {
            queryClient.invalidateQueries('eventsRequest');
        },
    });

    const eventsReq: EventRequest[] | undefined = queryClient.getQueryData([
        'eventsRequest',
    ]);

    const handleAddEventReq = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        const newEventReq: EventRequest = {
            eventno: generateEventNo(eventsReq),
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

    return (
        <>
            <div className="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
                <div className="mx-auto max-w-lg">
                    <h1 className="text-center text-2xl font-bold text-indigo-600 sm:text-3xl">
                        Events Request
                    </h1>
                    <p>{editMode ? 'editing' : 'adding'}</p>
                    <p className="mx-auto mt-4 max-w-md text-center text-gray-500">
                        Aplicación CRUD para consumir una API REST de eventos
                        usando Oracle Rest Data Services (ORDS) y Oracle XE.
                    </p>

                    <form
                        action=""
                        className="mb-0 mt-6 space-y-4 rounded-lg p-4 shadow-lg sm:p-6 lg:p-8 bg-[#30343f]"
                        onSubmit={handleAddEventReq}
                    >
                        <p className="text-center text-lg font-medium text-white">
                            {addMode
                                ? 'Agregar un nuevo evento'
                                : 'Editar un evento existente'}
                        </p>

                        <div className="mt-8 grid grid-cols-6 gap-6">
                            <div className="col-span-6 sm:col-span-3">
                                <label
                                    htmlFor="HeadlineAct"
                                    className="block text-sm font-medium text-white"
                                >
                                    Customer
                                </label>

                                <select
                                    name="HeadlineAct"
                                    id="HeadlineAct"
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    onChange={(e) => {
                                        setCustomer(e.target.value);
                                    }}
                                >
                                    <option value="">
                                        Select a customer...
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
                                    htmlFor="HeadlineAct"
                                    className="block text-sm font-medium text-white"
                                >
                                    Facility
                                </label>

                                <select
                                    name="HeadlineAct"
                                    id="HeadlineAct"
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    onChange={(e) => {
                                        setFacility(e.target.value);
                                    }}
                                >
                                    <option value="">
                                        Select a facility...
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
                                    selected={dateReq}
                                    onChange={(date: Date) => setDateReq(date)}
                                    dateFormat="dd/MM/yyyy"
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    name="dateReqPicker"
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
                                    selected={dateHeld}
                                    onChange={(date: Date) => setDateHeld(date)}
                                    dateFormat="dd/MM/yyyy"
                                    className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
                                    name="dateHeldPicker"
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
                                        name="dateAuthPicker"
                                        selected={dateAuth}
                                        onChange={(date: Date) =>
                                            setDateAuth(date)
                                        }
                                        dateFormat="dd/MM/yyyy"
                                        className="h-10 w-full rounded border-gray-200 text-sm shadow-sm"
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
                                    name="audienceEstimateInput"
                                    type="number"
                                    id="Quantity"
                                    value={estAudience}
                                    onChange={(e) => {
                                        setEstAudience(
                                            parseInt(e.target.value)
                                        );
                                    }}
                                    className="h-10 w-full rounded border-gray-200 sm:text-sm"
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
                                    name="audienceEstimateInput"
                                    type="number"
                                    id="Quantity"
                                    value={estCost}
                                    onChange={(e) => {
                                        setEstCost(parseInt(e.target.value));
                                    }}
                                    className="h-10 w-full rounded border-gray-200 sm:text-sm"
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
                                    name="statusSelect"
                                    id="statusSelect"
                                    className="h-10 w-full rounded-lg border-gray-200 text-sm shadow-sm"
                                    onChange={(e) => {
                                        console.log(e.target.value);
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

                        <button
                            type="submit"
                            className="block w-full rounded-lg bg-indigo-600 px-5 py-3 text-sm font-medium text-white"
                        >
                            {addMode ? 'Agregar evento' : 'Editar evento'}
                        </button>
                    </form>
                </div>
            </div>
        </>
    );
};

export default EventsForm;
