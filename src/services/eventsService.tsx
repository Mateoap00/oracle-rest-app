import axios, { AxiosResponse } from 'axios';
import { userName } from '../utils/database/user-name';

const baseUrl = `http://localhost:8080/ords/${userName}/rest-v1/request/`;

export type EventRequest = {
    eventno: string;
    dateheld: string;
    datereq: string;
    custno: string;
    facno: string;
    dateauth: string | null;
    status: string;
    estcost: number;
    estaudience: number;
    budno: string;
};

type Links = {
    rel: string;
    href: string;
};

type EventRequestData = {
    count: number;
    hasMore: boolean;
    items: EventRequest[];
    limit: number;
    links: Links[];
    offset: number;
};

export const getEventsRequest = async () => {
    try {
        const response: AxiosResponse<EventRequestData> =
            await axios.get(baseUrl);
        const data: EventRequest[] = response.data.items;
        return data;
    } catch (err) {
        console.log(err);
    }
};

export const createEventRequest = async (eventReq: EventRequest) => {
    try {
        const response: AxiosResponse<EventRequest> = await axios.post(
            baseUrl,
            eventReq
        );
        const data: EventRequest = response.data;
        return data;
    } catch (err) {
        console.log(err);
    }
};

export const updateEventRequest = async (eventReq: EventRequest) => {
    try {
        const response: AxiosResponse<EventRequest> = await axios.put(
            baseUrl,
            eventReq
        );
        const data: EventRequest = response.data;
        return data;
    } catch (err) {
        console.log(err);
    }
};

export const deleteEventRequest = async (eventno: string) => {
    try {
        await axios.delete(baseUrl, {
            data: { eventno },
        });
    } catch (err) {
        console.log(err);
    }
};
