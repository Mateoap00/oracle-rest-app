export const reverseFormatDate = (dateString: string) => {
    const onlyDate = dateString.split('T')[0];
    const day = onlyDate.split('-')[2];
    const month = onlyDate.split('-')[1];
    const year = onlyDate.split('-')[0];

    const formattedDate = new Date(`${month}/${day}/${year}`);
    return formattedDate;
};
