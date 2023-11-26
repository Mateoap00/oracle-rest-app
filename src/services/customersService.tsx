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

export const getCustomers = async () => {
    const response: AxiosResponse<CustomersRequest> = await axios.get(baseUrl);
    const data: Customers[] = response.data.items;
    return data;
};
