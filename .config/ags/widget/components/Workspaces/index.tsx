import Hyprland from "gi://AstalHyprland";
import { bind } from "astal";

function InactiveWorkspaceButton(props: { workspace:Hyprland.Workspace }): JSX.Element {
  return (
    <button 
        cssClasses={["inactive-workspace-button"]}
        label=""
	    onClicked={ () => props.workspace.focus() }
    />
  );
}

function ActiveWorkspaceButton(props: { workspace:Hyprland.Workspace }): JSX.Element {
  return (
    <button 
        cssClasses={["active-workspace-button"]}
        label=""
	    onClicked={ () => props.workspace.focus() }
    />
  );
}

const hyprland = Hyprland.get_default();

export default function Workspaces() {
	return <box cssClasses={["workspaces"]}>
			{bind(hyprland, "workspaces").as((workspaces: Hyprland.Workspace[]) => {
				return <box>
					{workspaces
                        .sort((a,b) =>  a.get_id() - b.get_id())
                        .map((workspace: Hyprland.Workspace) =>{
						    return bind(workspace.monitor, "activeWorkspace").as((activeWorkspace) => {
                                return activeWorkspace?.id === workspace.id ? <ActiveWorkspaceButton workspace={workspace}/> : <InactiveWorkspaceButton workspace={workspace} />
						})
		 			})
					} 
				</box>
			}
		)}
  		</box>
	
}
