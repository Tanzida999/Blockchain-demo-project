function ProjectTree() {
  return (
    <code>
      {`.\n`}
      {`├── client`}
      <span className="primary-color">
        {`   # React project (create-react-app)\n`}
        {`   ├── public\n`}
        {`   ├── src\n`}
        {`   │   ├── components\n`}
        {`   │   │   ├── Login.js`}
        {`   │   │   ├── Dashboard.js`}
        {`   │   ├── App.js`}
        {`   │   ├── index.js`}
        {`   ├── package.json`}
      </span>
      {`└── truffle`}
      <span className="primary-color">
        {`  # Truffle project\n`}
        {`   ├── contracts\n`}
        {`   │   ├── HealthInsurance.sol`}
        {`   ├── migrations\n`}
        {`   │   ├── 1_initial_migration.js`}
        {`   ├── test\n`}
        {`   ├── truffle-config.js`}
        {`   ├── package.json`}
      </span>
    </code>
  );
}

export default ProjectTree;
