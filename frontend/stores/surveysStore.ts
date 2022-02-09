import { writable } from "svelte/store"
import { surveys } from "canisters/surveys"

export const SURVEY_TEMPLATE = {
  title: "",
  questions: [
    {
      question: "",
    },
  ],
}

export type Question = {
  question: string
}

export type Survey = {
  title: string;
  questions: Question[];
}

export type ICSurveysData = {
  surveys: Survey[]
}

// 🦆
function isICSurveysData(data: any): data is ICSurveysData {
  return Array.isArray(data.surveys)
}

export async function fetchSurveys(): Promise<ICSurveysData> {
  console.log("fetchSurveys")

  try {
    const response = await surveys.get()
    const data: ICSurveysData = JSON.parse(response);

    if (!isICSurveysData(data)) {
      // TODO: separate initial reset
      postSurveys({ surveys: [] })
      throw new Error("unsupported structure")
    }
    return data
  } catch (error) {
    console.error(error)
  }
  return {
    surveys: [],
  }
}

export async function postSurveys(data: ICSurveysData) {
  console.log("post", data)
  
  try {
    if (!isICSurveysData(data)) {
      throw new Error("post invalid structure")
    }
    await surveys.set(JSON.stringify(data, null, 2))
  } catch (error) {
    console.error(error)
  }
}

/*
function createSurveysStore() {
  const { subscribe, update } = writable<ICSurveysData>(null)

  return {
    subscribe,
    fetch: async () => {
      const data = await fetchSurveys();
      return update((state) => data)
    },
    create: async (newSurvey: Survey) => {
      return new Promise(async resolve => {
        let updatedData = null;
        update((stateData: ICSurveysData) => {
          updatedData = {
            ...stateData,
            surveys: [...stateData.surveys, newSurvey],
          };
          return updatedData;
        });

        // TODO: try..catch + validation?

        await postSurveys(updatedData);
        resolve(updatedData);
      });
    },
  }
}
export const surveysStore = createSurveysStore()
*/
