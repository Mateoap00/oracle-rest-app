import { EventRequest } from '../services/eventsService';

export const generateEventNo = (eventsReq: EventRequest[] | undefined) => {
    if (typeof eventsReq === 'undefined') {
        return 'E1';
    } else {
        const lastEventNo = eventsReq[eventsReq.length - 1].eventno;
        const newEventNo = `E${parseInt(lastEventNo.slice(1)) + 1}`;
        return newEventNo;
    }
};
