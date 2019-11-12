import ApolloClient from "apollo-boost";
import gql from "graphql-tag";
import "cross-fetch/polyfill";
import prompt from 'prompt';

const uri = "https://api.numina.co/graphql";
const client = new ApolloClient({ uri });

const email = "samadams532@gmail.com";
const password = "Zf7h8uewiafnUm!nA";

const mutation = gql`
  mutation {
    logIn(
        email: "${email}",
        password: "${password}") {
      jwt {
        token
        exp
      }
    }
  }
`;

console.log(mutation);

client
  .mutate({ mutation })
  .then(data => console.log(data))
  .catch(error => console.error(error));

