import { useBasename, createHistory } from 'history'
export default useBasename(createHistory)({ basename: "/admin" });
