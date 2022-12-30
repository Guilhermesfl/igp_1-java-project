pipeline{
	agent { label 'slave' }
	tools {
		maven '3.8.6'
	}
	stages{
		stage("compiling"){
			steps{
				echo "========executing compiling========"
				sh "mvn compile"
			}
			post{
				always{
					echo "========always========"
				}
				success{
					echo "========compiling executed successfully========"
				}
				failure{
					echo "========compiling execution failed========"
				}
			}
		}
		stage("testing"){
			steps{
				echo "========executing testing========"
                sh "mvn test"
			}
			post{
				always{
					echo "========always========"
				}
				success{
					echo "========testing executed successfully========"
				}
				failure{
					echo "========testing execution failed========"
				}
			}
		}
		stage("packaging"){
			steps{
				echo "========executing packaging========"
                sh "mvn package"
				sh "docker build -t guilhermesfl/abc-technologies-retail ."
				sh "docker image push guilhermesfl/abc-technologies-retail:latest"
			}
			post{
				always{
					echo "========always========"
				}
				success{
					echo "========packaging executed successfully========"
				}
				failure{
					echo "========packaging execution failed========"
				}
			}
		}
		stage("deploying"){
			steps{
				echo "========executing deploying========"
				sh "git clone https://github.com/Guilhermesfl/igp_1-operations.git"
				sh "cd igp_1-operations/ansible/ && ansible-playbook -i inventory abc-technologies.yaml"
			}
			post{
				always{
					echo "========always========"
				}
				success{
					echo "========deploying executed successfully========"
				}
				failure{
					echo "========deploying execution failed========"
				}
			}
		}
	}
	post{
		always{
			echo "========always========"
		}
		success{
			echo "========pipeline executed successfully ========"
		}
		failure{
			echo "========pipeline execution failed========"
		}
	}
}