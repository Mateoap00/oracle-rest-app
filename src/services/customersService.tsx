import axios, { AxiosResponse } from 'axios';

const baseUrl = 'http://localhost:8080/ords/base2/rest-v1/customers/';

export type Customers = {
    custno: string;
    custname: string;
    address: string;
    internal: string;
    contact: string;
    phone: string;
    city: string;
    state: string;
    zip: string;
};

type Links = {
    rel: string;
    href: string;
};

type CustomersRequest = {
    items: Customers[];
    hasMore: boolean;
    limit: number;
    offset: number;
    count: number;
    links: Links[];
};

export type EventOfCustomer = {
    custno: string;
    custname: string;
    address: string;
    phone: string;
    city: string;
    eventno: string;
    dateheld: string;
    datereq: string;
    dateauth: string | null;
    status: string;
};

type AllEventsOfCustomer = {
    items: EventOfCustomer[];
    hasMore: boolean;
    limit: number;
    offset: number;
    count: number;
    links: Links[];
};

export const getCustomers = async () => {
    try {
        const response: AxiosResponse<CustomersRequest> =
            await axios.get(baseUrl);
        const data: Customers[] = response.data.items;
        return data;
    } catch (err) {
        console.log(err);
        return [];
    }
};

export const getAllEventsOfCustomer = async (custno: string) => {
    try {
        const response: AxiosResponse<AllEventsOfCustomer> = await axios.get(
            `${baseUrl}${custno}`
        );
        const data: EventOfCustomer[] = response.data.items;
        return data;
    } catch (err) {
        console.log(err);
    }
};
