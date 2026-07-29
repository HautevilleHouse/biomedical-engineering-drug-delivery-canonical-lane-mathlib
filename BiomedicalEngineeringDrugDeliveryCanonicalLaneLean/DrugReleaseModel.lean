import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure DrugReleaseModel where
  diffusionCoefficient : Prop
  releaseKinetics : Prop
  zeroOrderRelease : Prop
  firstOrderRelease : Prop
  controlledRelease : Prop

structure DrugReleaseModelEvidence (M : DrugReleaseModel) where
  diffusionCoefficientClosed : M.diffusionCoefficient
  releaseKineticsClosed : M.releaseKinetics
  zeroOrderReleaseClosed : M.zeroOrderRelease
  firstOrderReleaseClosed : M.firstOrderRelease
  controlledReleaseClosed : M.controlledRelease

def DrugReleaseModelClosed (M : DrugReleaseModel) : Prop :=
  M.diffusionCoefficient ∧ M.releaseKinetics ∧ M.zeroOrderRelease ∧ M.firstOrderRelease ∧ M.controlledRelease

theorem drug_release_model_closed_from_evidence (M : DrugReleaseModel) (E : DrugReleaseModelEvidence M) :
    DrugReleaseModelClosed M := by
  exact And.intro E.diffusionCoefficientClosed
    (And.intro E.releaseKineticsClosed
      (And.intro E.zeroOrderReleaseClosed
        (And.intro E.firstOrderReleaseClosed E.controlledReleaseClosed)))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse