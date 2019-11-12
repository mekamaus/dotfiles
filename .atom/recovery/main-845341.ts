import ApolloClient from "apollo-boost";
import gql from "graphql-tag";
import "cross-fetch/polyfill";
import prompts from "prompts";

const uri = "https://api.numina.co/graphql";
const client = new ApolloClient({ uri });

interface LoginResult {
  email: string;
  password: string;
}

const fields = [
  { type: "text", name: "email" },
  { type: "password", name: "password" }
];

function createLoginMutation({ email, password }: LoginResult): string {
  return gql`
    mutation {
      logIn(
          email: "${email}",
          password:"${password}") {
        jwt {
          token
          exp
        }
      }
    }
  `;
}

async function main() {
  const result = await prompts(fields);
  const mutation = createLoginMutation(result);
}

main();

prompt.get(
  [{ name: "email" }, { name: "password", hidden: true }],
  (err: Error, { email, password }: LoginResult) => {
    if (err) {
      console.error(err);
      return;
    }
    const mutation = gql`
      mutation {
        logIn(
            email: "${email}",
            password:"${password}") {
          jwt {
            token
            exp
          }
        }
      }
    `;
    client
      .mutate({ mutation })
      .then(console.log)
      .catch(console.error);
  }
);
