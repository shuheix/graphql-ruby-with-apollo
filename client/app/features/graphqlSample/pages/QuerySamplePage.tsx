import { gql, useQuery } from "urql";
import { client } from "app/lib/urqlClient";

export const clientLoader = async () => {
	const GET_WORKSPACES_DOCUMENT = gql`
		query getWorkspaces {
			workspaces {
				id
				name
				channels{
					id
					messages{
						id
						content
					}
				}
			}
		}
	`;

	const result = await client.query(GET_WORKSPACES_DOCUMENT, {}).toPromise();

	console.log(result);
};

export default function QuerySamplePage() {
	return (
		<div>
			<p>This is QuerySamplePage</p>
		</div>
	);
}
