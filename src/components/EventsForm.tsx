import { useState } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
const EventsForm = () => {
    const [selectedDate, setSelectedDate] = useState<Date | null>(null);
    return (
        <>
            <div className="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
                <div className="mx-auto max-w-lg">
                    <h1 className="text-center text-2xl font-bold text-indigo-600 sm:text-3xl">
                        Events Request
                    </h1>

                    <p className="mx-auto mt-4 max-w-md text-center text-gray-500">
                        Lorem ipsum dolor sit amet, consectetur adipisicing
                        elit. Obcaecati sunt dolores deleniti inventore quaerat
                        mollitia?
                    </p>

                    <form
                        action=""
                        className="mb-0 mt-6 space-y-4 rounded-lg p-4 shadow-lg sm:p-6 lg:p-8 bg-[#30343f]"
                    >
                        <p className="text-center text-lg font-medium text-white">
                            Add a new event request
                        </p>

                        <div>
                            <label
                                htmlFor="HeadlineAct"
                                className="block text-sm font-medium text-white"
                            >
                                Customer
                            </label>

                            <select
                                name="HeadlineAct"
                                id="HeadlineAct"
                                className="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
                            >
                                <option value="">Select a customer...</option>
                                <option value="JM">John Mayer</option>
                                <option value="SRV">Stevie Ray Vaughn</option>
                                <option value="JH">Jimi Hendrix</option>
                                <option value="BBK">B.B King</option>
                                <option value="AK">Albert King</option>
                                <option value="BG">Buddy Guy</option>
                                <option value="EC">Eric Clapton</option>
                            </select>
                        </div>

                        <div>
                            <label
                                htmlFor="HeadlineAct"
                                className="block text-sm font-medium text-white"
                            >
                                Faculty
                            </label>

                            <select
                                name="HeadlineAct"
                                id="HeadlineAct"
                                className="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
                            >
                                <option value="">Select a Faculty...</option>
                                <option value="JM">John Mayer</option>
                                <option value="SRV">Stevie Ray Vaughn</option>
                                <option value="JH">Jimi Hendrix</option>
                                <option value="BBK">B.B King</option>
                                <option value="AK">Albert King</option>
                                <option value="BG">Buddy Guy</option>
                                <option value="EC">Eric Clapton</option>
                            </select>
                        </div>

                        <div>
                            <div className="w-full">
                                <label
                                    htmlFor="datePicker01"
                                    className="block text-sm font-medium text-white"
                                >
                                    Pick date of authorization
                                </label>
                                <DatePicker
                                    selected={selectedDate}
                                    onChange={(date: Date) =>
                                        setSelectedDate(date)
                                    }
                                    dateFormat="MM/dd/yyyy"
                                    className="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
                                    name="datePicker01"
                                />
                            </div>
                        </div>

                        <button
                            type="submit"
                            className="block w-full rounded-lg bg-indigo-600 px-5 py-3 text-sm font-medium text-white"
                        >
                            Add Event Request
                        </button>
                    </form>
                </div>
            </div>
        </>
    );
};

export default EventsForm;
