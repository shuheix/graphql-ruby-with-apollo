import { NavLink, Outlet } from "react-router";

export default function GraphqlSampleLayout() {
	return (
		<div>
			<header>
				<nav>
					<ul>
						<li>
							<NavLink
								to="/"
								className={({ isActive }) =>
									isActive
										? "font-bold text-blue-600 underline"
										: "text-gray-700 hover:text-blue-500"
								}
							>
								Home
							</NavLink>
						</li>
						<li>
							<NavLink
								to="/query"
								className={({ isActive }) =>
									isActive
										? "font-bold text-blue-600 underline"
										: "text-gray-700 hover:text-blue-500"
								}
							>
								QuerySample
							</NavLink>
						</li>
						<li>
							<NavLink
								to="/mutation"
								className={({ isActive }) =>
									isActive
										? "font-bold text-blue-600 underline"
										: "text-gray-700 hover:text-blue-500"
								}
							>
								MutationSample
							</NavLink>
						</li>
						<li>
							<NavLink
								to="/subscription"
								className={({ isActive }) =>
									isActive
										? "font-bold text-blue-600 underline"
										: "text-gray-700 hover:text-blue-500"
								}
							>
								SubscriptionSample
							</NavLink>
						</li>
					</ul>
				</nav>
			</header>
			<main>
				<Outlet />
			</main>
		</div>
	);
}
